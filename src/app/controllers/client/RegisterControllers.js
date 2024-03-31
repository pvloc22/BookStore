const {conn, sql} = require('../../../config/db/index')
const registerModel = require('../../../model/client/register.model')


class RegisterControllers {
    // [GET]
    RegisterGet(req, res){
        res.render('Register', { layout: 'Login_Layout.hbs' });
    }

    // [Post]
    async RegisterPost(req, res){
        registerModel.RegisterPost(req, (err, data)=>{
            if(err) res.json({err: err})
            else res.json({err:false})
        })

    }
}

module.exports = new RegisterControllers;