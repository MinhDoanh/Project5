USE [levietanh1202_spms]
GO
/****** Object:  StoredProcedure [dbo].[check_user]    Script Date: 08/11/2023 12:29:32 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[register_user]
	@id VARCHAR(36),
	@email NVarChar(255),
	@password NVarChar(255)
AS
BEGIN
    INSERT INTO [user] VALUES (@id, @email, @password);
END;

ALTER PROCEDURE [dbo].[check_user]
	@email NVarChar(255)
AS
BEGIN
/*
    SET NOCOUNT ON;
    
    DECLARE @EmailExists BIT;

    -- Kiểm tra xem email có tồn tại trong bảng user không
    IF EXISTS (SELECT 1 FROM [user] WHERE Email = @Email)
        SET @EmailExists = 1; -- Email tồn tại
    ELSE
        SET @EmailExists = 0; -- Email không tồn tại

    -- Trả về kết quả
    SELECT @EmailExists AS EmailExists;
*/

	SET NOCOUNT ON;
    
    DECLARE @Password NVARCHAR(255);
	DECLARE @Id VARCHAR(36);

    -- Kiểm tra xem email có tồn tại trong bảng user không
    IF EXISTS (SELECT 1 FROM [user] WHERE Email = @Email)
        SELECT @Id = id, @Password = password -- Lấy id và password của người dùng
        FROM [user]
        WHERE Email = @Email;
    ELSE
	BEGIN
        SET @Id = ''; -- Email không tồn tại
		SET @Password = ''; -- Email không tồn tại
	END

    -- Trả về kết quả
    SELECT  @Id as id, @Password AS password FOR JSON PATH;

END;