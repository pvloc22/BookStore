const express = require('express');
const router = express.Router();
const updateBookAdminControllers = require('../../app/controllers/admin/UpdateBookAdminControllers')

router.put('/updateBook',updateBookAdminControllers.UpdateBookLibrarianPut)
router.get('/:slug/:token',updateBookAdminControllers.check_token,updateBookAdminControllers.UpdateBookLibrarianGet)

module.exports = router