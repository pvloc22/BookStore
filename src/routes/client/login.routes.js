const express = require('express');
const router = express.Router();
const loginControllers = require('../../app/controllers/client/LoginControllers')


router.post('/', loginControllers.loginPost)
router.get('/', loginControllers.loginGet)

module.exports = router
