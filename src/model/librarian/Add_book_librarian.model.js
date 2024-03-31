const {conn, sql} = require('../../config/db/index')
class Add_book_librarianModel{
    async insert_book(body, pathImage,result){

        const {tittle,author,publishingyear,hasleft,price,language,routine, genre, pages, country} = body
        const pool = await conn;
        const sqlString = 'INSERT_BOOK'

        await pool.request()
        .input('TITTLE', sql.VarChar,tittle)
        .input('AUTHOR', sql.VarChar,author)
        .input('PUBLISHINGYEAR', sql.Int,publishingyear)
        .input('GENRE', sql.VarChar,genre)
        .input('COUNTRY', sql.VarChar,country)
        .input('LANGUAGE_BOOK', sql.VarChar,language)
        .input('PRICE', sql.Float,price)
        .input('DURATION', sql.Int,routine)
        .input('HASLEFT', sql.Int,hasleft)
        .input('PATHIMAGE', sql.VarChar,pathImage)
        .input('PAGES', sql.Int, pages)
        .execute(sqlString,(err, data)=>{
            if (err) {
                console.log(err)
                result(true, data)
            }
            else result(null, data)
        })
    }

}

module.exports = new Add_book_librarianModel

