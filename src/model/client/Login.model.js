const {conn, sql} = require('../../config/db/index')
class LoginModel {
    async GetPassword(username, result){
        var pool = await conn;

        var sqlStringGet = 'SELECT A.USERNAME, A.[PASSWORD], A.ID, U.TYPE_USER, U.ISACTIVE from ACCOUNT A JOIN USERS U ON A.ID = U.ID WHERE A.USERNAME = @USERNAME'
        await pool.request()
        .input('USERNAME', sql.VarChar, username)
        .query(sqlStringGet, (err, data)=>{
            if(err){
            result(true, [{}])
            }
            else{
                result(null, data.recordsets)
            }
        })
    }
}

module.exports = new LoginModel;