const express = require('express');
const router = express.Router();
const accountUpdateLibrarianControllers = require('../../app/controllers/librarian/AccountUpdateLibrarianControllers')

router.get('/:token', accountUpdateLibrarianControllers.check_token,accountUpdateLibrarianControllers.AccountUpdateLibrarianGet)


module.exports = router