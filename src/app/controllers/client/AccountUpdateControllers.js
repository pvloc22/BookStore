const accountUpdateModel = require('../../../model/client/AccountUpdate.model')
const viewProfileModelModel = require('../../../model/client/ViewProfile.model')


class AccountUpdateControllers {
    AccountUpdateGet(req, res) {
        const url_auth = { pass: req.session.user.password }

        viewProfileModelModel.GetInfoClient(req.session.user.username, (err, data) => {
            if (err) { res.json({ err: true }); return }
            else{
                if (data[0].length > 0) {
                    try {
                        res.render('AccountUpdate', { layout: 'Client_Layout.hbs', URL_AUTH: url_auth, data: data[0][0]});
                    } catch (error) {
                        res.render('/erro')
                    }
                    return
                }
                res.render('/erro')
            }
        })
    }
    accountUpdatePost(req,res){
        accountUpdateModel.updateInfoUser(req.body, req.session.user.id ,(err, data)=>{
            if (err) res.json({ err: true})
            else res.json({err: false})
        })
    }
    
}
module.exports = new AccountUpdateControllers;