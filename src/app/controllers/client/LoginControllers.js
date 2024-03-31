const bcrypt = require('bcrypt');
const LoginModel = require('../../../model/client/Login.model')
class LoginControllers {
    // [Gett] /login
    loginGet(req, res) {
        res.render('Login', { layout: 'Login_Layout.hbs' });
    }



    async loginPost(req, res) {

        const { username, password } = req.body;
        await LoginModel.GetPassword(username, (err, data) => {
            if (err) res.json({ err: true, status: 1})
            if (data[0].length > 0) {
                if(!data[0][0].ISACTIVE){
                    res.json({err:true, status: 2})
                    return
                }
                if (bcrypt.compareSync(password, data[0][0].PASSWORD)) {
                    const modifiedHash =  data[0][0].PASSWORD.replace(/\//g, '_');
                    //insert session 
                    req.session.user = {
                        username: username,
                        password: modifiedHash,
                        id: data[0][0].ID,
                        typeuser: data[0][0].TYPE_USER,
                    }
                    res.json({ err: false, typeuser: data[0][0].TYPE_USER, password: modifiedHash})
                    return
                }
            }
            res.json({ err: true})
        })
    }
}
module.exports = new LoginControllers;