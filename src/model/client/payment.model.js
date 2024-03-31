const {conn, sql} = require('../../config/db/index')

class payment{
    async readDetailTrans(UID,result){
        const pool = await conn;
        
        const sqlString = 'SELECT D.BID, D.CURRENTPRICE, D.TID, D.CURRENTDURATION, B.PATHIMAGE, B.TITTLE FROM DETAILED_TRANS D JOIN TRANSACTIONS T ON D.TID = T.TID JOIN BOOK B ON B.BID = D.BID WHERE T.CLI_ID = @UID AND T.BORROWEDDATE IS NULL'

        await pool.request()
        .input('UID', sql.VarChar, UID)
        .query(sqlString, (err, data) =>{
            if(err) result(true, data)
            else result (null, data.recordsets[0])
        })

    }
    async insertBookTocart(UID, BID, result){
        const pool = await conn;

        var execute = 'INSERT_DETAIL_TRAN'
        await pool.request()
        .input('UID', sql.VarChar, UID)
        .input('BID', sql.VarChar, BID)
        .execute(execute, (err, data)=>{
            if(err){
                console.log(err)
                result(true, data)
            }
            else result(null, data)
        })
    }
    async removeBookToCartModel (TID, BID, result){
        const pool = await conn;
        var execute = 'DELETE_DETAIL_TRAN'
        await pool.request()
        .input('TID', sql.VarChar, TID)
        .input('BID', sql.VarChar, BID)
        .execute(execute, (err, data)=>{
            if(err){
                console.log(err)
                result(true, data)
            }
            else result(null, data)
        })
    }
    async paymentBookToCartModel (TID, result){
        const pool = await conn;
        var execute = 'UPDATE_TRANS_PAY'
        await pool.request()
        .input('TID', sql.VarChar, TID)
        .execute(execute, (err, data)=>{
            if(err){
                console.log(err)
                result(true, data)
            }
            else result(null, data)
        })
    }
    async checkPasswordModel(username, result){
        const pool = await conn;
        var execute = 'FIND_USER_PASSWORD'
        await pool.request()
        .input('USERNAME', sql.VarChar, username)
        .execute(execute, (err, data)=>{
            if(err){
                console.log(err)
                result(true, data)
            }
            else result(null, data.recordset[0])
        })
    }
}
module.exports = new payment