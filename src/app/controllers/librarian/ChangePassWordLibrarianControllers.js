const changePasswordModel = require('../../../model/client/changePassword.model')


class ChangePassWordLibrarianControllers {
    ChangePassWordLibrarianGet(req, res) {
        const url_auth = {pass: req.session.user.password}
        res.render('ChangePasswordUser', { layout: 'Librarian_Layout.hbs', URL_AUTH:url_auth, username: req.session.user.username });
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

module.exports = new ChangePassWordLibrarianControllers;