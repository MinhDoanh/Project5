#include <Wire.h>
#include <Adafruit_Fingerprint.h>
#include <SocketIoClient.h>

#define RX_PIN 16
#define TX_PIN 17

SocketIoClient webSocket;

#define NODEJS_SERVER_IP "192.168.0.104"  // Địa chỉ IP của NodeJS server
#define NODEJS_SERVER_PORT 3000            // Cổng của NodeJS server

Adafruit_Fingerprint finger = Adafruit_Fingerprint(&Serial2);

void setup() {
  Serial.begin(115200);
  Serial1.begin(57600, SERIAL_8N1, RX_PIN, TX_PIN);
  finger.begin(57600);
//  if (!) {
//    Serial.println("Không tìm thấy cảm biến vân tay. Kiểm tra kết nối!");
//    while (1);
//  }

  if (finger.verifyPassword()) {
    Serial.println("Cảm biến vân tay đã sẵn sàng!");
  } else {
    Serial.println("Không thể kết nối với cảm biến vân tay. Kiểm tra kết nối và khởi động lại ESP32!");
    while (1);
  }

  webSocket.on("connect", onWebSocketConnected);
  webSocket.begin(NODEJS_SERVER_IP, NODEJS_SERVER_PORT);
}

void loop() {
  webSocket.loop();

  finger.getImage();
  int result = finger.image2Tz(1);

  if (result == FINGERPRINT_OK) {
    Serial.println("Vui lòng gửi 'a' để đăng ký vân tay.");
  }

  if (Serial.available() > 0) {
    char input = Serial.read();
    if (input == 'a') {
      Serial.println("Bắt đầu quá trình đăng ký vân tay...");

      result = finger.createModel();
      if (result == FINGERPRINT_OK) {
        Serial.println("Quét vân tay. Nhấn 'a' lần nữa để hoàn tất quá trình đăng ký.");
        while (result != FINGERPRINT_NOFINGER) {
          result = finger.getImage();
        }
      }

      if (Serial.available() > 0 && Serial.read() == 'a') {
        result = finger.createModel();
        if (result == FINGERPRINT_OK) {
          result = finger.storeModel(1);
          if (result == FINGERPRINT_OK) {
            Serial.println("Đăng ký vân tay thành công!");

            // Lấy template dữ liệu vân tay
            uint8_t templateData[162];
            uint16_t templateSize;
            result = finger.getModel(1, templateData, &templateSize);

            if (result == FINGERPRINT_OK) {
              // Gửi template dữ liệu vân tay đến NodeJS server
              webSocket.emitBinary("fingerprintRegistered", templateData, templateSize);
            } else {
              Serial.println("Lỗi khi lấy template dữ liệu vân tay!");
            }
          } else {
            Serial.println("Lỗi khi lưu mô hình vân tay!");
          }
        } else {
          Serial.println("Lỗi khi tạo mô hình vân tay!");
        }
      }
    }
  }
}

void onWebSocketConnected(const char *payload, size_t length) {
  Serial.println("Connected to NodeJS server via WebSocket!");
}
