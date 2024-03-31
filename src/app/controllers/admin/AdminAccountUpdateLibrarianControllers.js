
class AdminAccountUpdateLibrarianControllers {
    AdminAccountUpdateLibrarianGet(req, res) {
        res.render('AdminAccountUpdateLibrarian', { layout: 'Admin_Layout.hbs' });

    }
}

module.exports = new AdminAccountUpdateLibrarianControllers;