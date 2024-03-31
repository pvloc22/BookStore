const viewClientModel = require('../../../model/librarian/ViewClient.model')
const viewProfileModelModel = require('../../../model/client/ViewProfile.model')

class ViewClientControllers {
    ViewClientGet(req, res) {
        viewClientModel.getUsers((err, data) => {
            if (err) res.redirect('erro')
            else {
                const url_auth = {pass: req.session.user.password}
                res.render('ViewClient', { layout: 'Librarian_Layout.hbs', data: data, URL_AUTH: url_auth});
            }
        })
    }
    check_token(req, res, next){
        try {
            const token = req.params.token
            const token_ss = req.session.user.password
            if(token == token_ss)
            {
                next()
                return
            }
            throw 'Token not compare'
        } catch (error) {
            res.redirect('/erro')
        }
    }
    f_updateIsActive(req, res){
        const {uid, isactive} = req.body

        viewClientModel.updateIsActive_model(uid, isactive, (err, data)=>{
            if(err) res.json({err: true})
            else res.json({err: false})
        })

    }
    viewInformationClient(req, res){
        viewProfileModelModel.GetInfoClient_uid(req.params.uid,(err, data)=>{
            if(err) {res.json({err:true}); return}
            if(data[0].length > 0){
                try {
                    res.render('ViewProfile', { layout: 'Librarian_Layout.hbs', data: data[0][0], URL_AUTH:{pass: req.session.user.password} });  
                } catch (error) {
                    res.render('/erro')
                }
                return
            }
            res.json({err: true})
        })
    }
}

module.exports = new ViewClientControllers;


