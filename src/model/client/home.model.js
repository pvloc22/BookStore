const {conn, sql} = require('../../config/db/index')

class HomeModel {
    async Getbook(result){
        const pool = await conn;

        var sqlString = 'SELECT * FROM BOOK WHERE STATEBOOK = @state'

        await pool.request()
        .input('state', sql.VarChar, 'TRUE')
        .query(sqlString, (err, data)=>{
            if(err) result(true, data.recordsets)
            else result(null, data.recordsets)
        })
    }

    async findBook(BID,result){
        const pool = await conn;

        var sqlString = 'SELECT * FROM BOOK WHERE @BID = BID AND STATEBOOK = @STATE'

        await pool.request()
        .input('BID', sql.VarChar, BID)
        .input('STATE', sql.VarChar, 'TRUE')
        .query(sqlString, (err, data)=>{
            if(err) result(true, data.recordsets)
            else result(null, data.recordsets)
        })
    }

    async searchBook(titlle,result){
        const pool = await conn;

        var executeSearch = 'SEARCH_BOOK'
        await pool.request()
        .input('NAME_BOOK', sql.VarChar, titlle)
        .execute(executeSearch, (err, data)=>{
            if(err) result(true, data)
            else result(null, data)
        })
    }

    async insertFavoriteBook(UID, BID, result){
        const pool = await conn;

        var execute = 'INSERT_FAVORITES_BOOK'
    
        await pool.request()
        .input('UID', sql.VarChar, UID)
        .input('BID', sql.VarChar, BID)
        .execute(execute, (err, data)=>{
            if(err)result(true, null)
            else result(null, null)
        })
    }

    async deleteFavoriteBook(UID, BID, result){
        const pool = await conn;

        var execute = 'DELETE_FAVORITES_BOOK'
    
        await pool.request()
        .input('UID', sql.VarChar, UID)
        .input('BID', sql.VarChar, BID)
        .execute(execute, (err, data)=>{
            if(err)result(true, null)
            else result(null, null)
        })
    }

    async genreModel(result){
        const pool = await conn;

        var sqlString = 'SELECT * from T_GENRE'
    
        await pool.request()
        .query(sqlString, (err, data)=>{
            if(err)result(true, null)
            else result(null, data)
        })
    }
    async filterGenreModel(genre,result){
        const pool = await conn;

        var sqlString = 'SELECT * FROM BOOK WHERE STATEBOOK = @STATE AND GENRE = @GENRE'
    
        await pool.request()
        .input('STATE', sql.VarChar, 'TRUE')
        .input('GENRE', sql.VarChar, genre)
        .query(sqlString, (err, data)=>{
            if(err)result(true, null)
            else result(null, data.recordsets[0])
        })
    }

}

module.exports = new HomeModel;