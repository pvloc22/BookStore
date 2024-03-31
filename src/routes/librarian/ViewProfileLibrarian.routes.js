const express = require('express');
const router = express.Router();
const  viewProfileControllers = require('../../app/controllers/librarian/ViewProfileLibrarianControllers')

router.get('/:token', viewProfileControllers.check_token,viewProfileControllers.ViewProfileLibrarianGet)


module.exports = router