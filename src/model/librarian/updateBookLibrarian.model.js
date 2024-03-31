const { conn, sql } = require('../../config/db/index')
class UpdateBookLibrarianModel{
    async UpdateInforBook(body, result){
        const pool = await conn;
        const sqlString = 'UPDATEBOOK'
        const{bookname, author, publishingyear, hasleft, price, language,routine, pages,genre, bid} = body
        console.log(bid)
        await pool.request()
        .input('BID', sql.VarChar, bid)
        .input('TITTLE', sql.VarChar, bookname)
        .input('AUTHOR', sql.VarChar, author)
        .input('PUBLISHINGYEAR', sql.VarChar, publishingyear)
        .input('GENRE', sql.VarChar, genre)
        .input('LANGUAGE_BOOK', sql.VarChar, language)
        .input('PRICE', sql.VarChar, price)
        .input('DURATION', sql.VarChar, routine)
        .input('HASLEFT', sql.VarChar, hasleft)
        .input('PAGES', sql.VarChar,pages)
        .execute(sqlString, (err, data) => {
                if (err) {
                    console.log(err)
                    result(true, data)
                }
                else result(null, data)
            })
    }
}

module.exports = new UpdateBookLibrarianModel