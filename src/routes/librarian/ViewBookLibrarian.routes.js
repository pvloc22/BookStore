const express = require('express');
const router = express.Router();
const viewBookLibrarianControllers  = require('../../app/controllers/librarian/ViewBookLibrarianControllers')

router.post('/search', viewBookLibrarianControllers.ViewBookLibrarianSearch)
router.get('/:slug/:token', viewBookLibrarianControllers.check_token, viewBookLibrarianControllers.viewInfoBookLibrarian)
router.get('/:token', viewBookLibrarianControllers.check_token, viewBookLibrarianControllers.ViewBookLibrarianGet)

module.exports = router