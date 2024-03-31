
const express = require('express');
const router = express.Router();
const  viewProfileControllers = require('../../app/controllers/client/ViewProfileControllers')

router.get('/:token',viewProfileControllers.ViewProfileCheck,viewProfileControllers.ViewProfileGet)


module.exports = router
