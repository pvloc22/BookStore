const express = require('express');
const router = express.Router();
const viewBookInforLibrarianControllers = require('../../app/controllers/librarian/ViewBookInforLibrarianControllers')


router.delete('/delete',viewBookInforLibrarianControllers.ViewBookInforLibrarianDelete)
router.get('/',viewBookInforLibrarianControllers.ViewBookInforLibrarianGet)

module.exports = router