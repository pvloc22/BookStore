const historyModel = require('../../../model/client/history.model')

class HistoryControllers {
    HistoryGet(req, res) {
        const url_auth = {pass: req.session.user.password}
        historyModel.showHistory(req.session.user.id, (err, data)=>{
            if(err) console.log(err)
            else{
                console.log(data)
                res.render('History', { layout: 'Client_Layout.hbs' ,URL_AUTH: url_auth, data: data});
            }
        })

    }
}

module.exports = new HistoryControllers;