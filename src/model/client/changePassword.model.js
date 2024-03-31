const {conn, sql} = require('../../config/db/index')
const bcrypt = require('bcrypt')

class changePasswordModel {
    async updatePasswordModel(UID, password, result){

        password = bcrypt.hashSync(password,10)
        var pool = await conn;
        
        var execute = 'CHANGE_PASSWORD_CLIENT'
        await pool.request()
        .input('ID', sql.VarChar, UID)
        .input('PASS', sql.VarChar, password)
        .execute(execute, (err, data)=>{
            if(err){
                result(true, null)
            }
            else  result(false, password)
        })  
    }
}

module.exports = new changePasswordModel;