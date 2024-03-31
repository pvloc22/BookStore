const {conn, sql} = require('../../config/db/index')
class AdminViewLibrarianModel{
    async viewLibrarian(result){
        const pool = await conn;

        const sqlString = 'SELECT * FROM USERS WHERE TYPE_USER = @typeUser'
        
        await pool.request()
        .input('typeUser', sql.VarChar, 'LIBRARIAN')
        .query(sqlString, (err, data) => {
                if (err) {
                    console.log(err)
                    result(true, data)
                }
                else result(null, data.recordsets[0])
            })
    }
}
module.exports = new AdminViewLibrarianModel