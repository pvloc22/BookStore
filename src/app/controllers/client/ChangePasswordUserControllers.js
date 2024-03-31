const changePasswordModel = require('../../../model/client/changePassword.model')

class ChangePasswordUserControllers {
    ChangePasswordUserGet(req, res) {
        const url_auth = {pass: req.session.user.password}
        res.render('ChangePasswordUser', { layout: 'Client_Layout.hbs', URL_AUTH:url_auth, username: req.session.user.username });
    }

    ChangePasswordUserPost(req, res){
        changePasswordModel.updatePasswordModel(req.session.user.id, req.body.password, (err, data)=>{
            if(err){
                res.json({err: true})
            }
            else{
                const modifiedHash =  data.replace(/\//g, '_');
                req.session.user.password = modifiedHash
                res.json({err: false})
            }
        })
    }
}

module.exports = new ChangePasswordUserControllers;