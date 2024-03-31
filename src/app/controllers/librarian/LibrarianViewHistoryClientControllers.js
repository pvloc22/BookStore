
class LibrarianViewHistoryClientControllers{
    LibrarianViewHistoryClientGet(req, res) {
        res.render('LibrarianViewHistoryClient', { layout: 'Librarian_Layout.hbs' });

    }
}

module.exports = new LibrarianViewHistoryClientControllers;