const {conn, sql} = require('../../config/db/index')
class AccountUpdateModel {
    async updateInfoUser(data, UID,result){

        const {firstname,lastname,gender,address,email,bankaccount,bankname, phonenumber} = data
        var pool = await conn;
        var execute = 'UPDATE_INFORMATION_CLIENT'
        await pool.request()
        .input('ID', sql.VarChar, UID)
        .input('ADDRESS_U', sql.NVarChar, address)
        .input('EMAIL', sql.VarChar, email)
        .input('PHONENUMBER', sql.VarChar, phonenumber)
        .input('LASTNAME', sql.VarChar, lastname)
        .input('FIRSTNAME', sql.VarChar, firstname)
        .input('GENRE', sql.VarChar, gender)
        .input('BANKID', sql.VarChar, bankname)
        .input('BANKACCNUM', sql.VarChar, bankaccount)
        .execute(execute, (err, data)=>{
            if(err){
                result(true, null)
                console.log(err)
            }
            else  result(false, data)
        })  
    }
}
module.exports = new AccountUpdateModel;