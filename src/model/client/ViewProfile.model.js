const {conn, sql} = require('../../config/db/index')
class ViewProfileModel {
    async GetInfoClient(username, result){
        var pool = await conn;

        var sqlStringGet = 'SELECT * FROM USERS WHERE USERNAME = @USERNAME'
        await pool.request()
        .input('USERNAME', sql.VarChar, username)
        .query(sqlStringGet, (err, data)=>{
            if(err){
                console.log(err)
                result(true, err)
            }
            else{
                console.log(data)
                result(null, data.recordsets)
            }
        })
    }
    async GetInfoClient_uid(uid, result){
        var pool = await conn;

        var sqlStringGet = 'SELECT * FROM USERS WHERE ID = @uid'
        await pool.request()
        .input('uid', sql.VarChar, uid)
        .query(sqlStringGet, (err, data)=>{
            if(err){
                // console.log(err)
                result(true, err)
            }
            else{
                // console.log(data)
                result(null, data.recordsets)
            }
        })
    }
}





module.exports = new ViewProfileModel
