const express = require('express');
const router = express.Router();
const librarianViewHistoryClientControllers  = require('../../app/controllers/librarian/LibrarianViewHistoryClientControllers')

router.get('/',librarianViewHistoryClientControllers.LibrarianViewHistoryClientGet)


module.exports = router