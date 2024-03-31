
class AdminChangePasswordUserControllers {
    AdminChangePasswordUserGet(req, res) {
        res.render('AdminChangePasswordUser', { layout: 'Admin_Layout.hbs' });
    }
}

module.exports = new AdminChangePasswordUserControllers;