const {conn, sql} = require('../../config/db/index')
class MyInterestingBook {

    async readFavorites(result){
        var pool = await conn;

        var sqlStringGet = 'SELECT B.TITTLE, B.AUTHOR, B.BID, B.PATHIMAGE FROM FAVORITES F JOIN BOOK B ON F.BID = B.BID'
        await pool.request()
        .query(sqlStringGet, (err, data)=>{
            if(err){
                result(true, data.recordsets)
            }
            else{
                result(null, data.recordsets)
            }
        })
    }
}

module.exports = new MyInterestingBook;