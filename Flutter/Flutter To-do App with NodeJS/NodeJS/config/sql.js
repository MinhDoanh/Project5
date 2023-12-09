const sql = require('mssql');

var config = {
    server: "sql.bsite.net\\MSSQL2016",
    user: "levietanh1202_spms",
    password: "IoTtainangK18",
    database: "levietanh1202_spms",
    parseJSON: true,
    options: {
        trustedConnection: true,
        encrypt: true,
        enableArithAbort: true,
        trustServerCertificate: true,
        integratedSecurity: true
    }
};

async function connectionPool() {
    try {
        console.time('Time connect db')
        var pool = await sql.connect(config);

        console.timeEnd('Time connect db')
        return pool;
    } catch (err) {
        // ... error checks
        console.log("ERROR NAME IS " + err)
    }
}

module.exports = connectionPool();