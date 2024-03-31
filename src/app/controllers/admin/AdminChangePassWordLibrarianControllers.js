
class AdminChangePassWordLibrarianControllers {
    AdminChangePassWordLibrarianGet(req, res) {
        res.render('AdminChangePassWordLibrarian', { layout: 'Admin_Layout.hbs' });
    }
}

module.exports = new AdminChangePassWordLibrarianControllers;