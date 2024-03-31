const express = require('express');
const router = express.Router();
const changePasswordUserControllers = require('../../app/controllers/client/ChangePasswordUserControllers')

router.get('/:token',changePasswordUserControllers.ChangePasswordUserGet)
router.post('/changpassword', changePasswordUserControllers.ChangePasswordUserPost)

module.exports = router