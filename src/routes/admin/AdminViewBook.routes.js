const express = require('express');
const router = express.Router();
const adminViewBookControllers = require('../../app/controllers/admin/AdminViewBookControllers')

router.get('/:token', adminViewBookControllers.check_token,adminViewBookControllers.AdminViewBookGet)


module.exports = router