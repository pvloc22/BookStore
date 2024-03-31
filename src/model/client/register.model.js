const { conn, sql } = require('../../config/db/index')
const bcrypt = require('bcrypt');

class RegisterModel {
  async RegisterPost(req, result) {
    var pool = await conn;
    const { username, email, password, confirmpassword, firstname, lastname, gender, phonenumber, address,
      bankaccount, bankname, typeuser } = req.body;

    const passHash = bcrypt.hashSync(password, 10)

    var sqlString = 'INSERT_USERS'
    await pool.request()
      .input('USERNAME', sql.VarChar, username)
      .input('PASS', sql.VarChar, passHash)
      .input('ADDRESS_U', sql.NVarChar, address)
      .input('EMAIL', sql.VarChar, email)
      .input('PHONENUMBER', sql.VarChar, phonenumber)
      .input('LASTNAME', sql.NVarChar, lastname)
      .input('FIRSTNAME', sql.NVarChar, firstname)
      .input('TYPE_USER', sql.VarChar, typeuser)
      .input('GENRE', sql.VarChar, gender)
      .execute(sqlString, (err, data) => {
        if (err) result(true, data)
        else result(null, data)
      })

  }
}
module.exports = new RegisterModel