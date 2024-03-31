const express = require('express');
const router = express.Router();
const updateBookLibrarianControllers  = require('../../app/controllers/librarian/UpdateBookLibrarianControllers')

router.put('/updateBook',updateBookLibrarianControllers.UpdateBookLibrarianPut)
router.get('/:slug',updateBookLibrarianControllers.UpdateBookLibrarianGet)


module.exports = router