const express = require('express');
const router = express.Router();
const adminViewBookInforControllers = require('../../app/controllers/admin/AdminViewBookInforControllers')

router.get('/:BID/:token', adminViewBookInforControllers.check_token,adminViewBookInforControllers.AdminViewBookInforGet)


module.exports = router