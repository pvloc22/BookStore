const express = require('express');
const router = express.Router();
const  accountUpdateControllers = require('../../app/controllers/client/AccountUpdateControllers')

router.get('/:token',accountUpdateControllers.AccountUpdateGet)
router.post('/updateUser',accountUpdateControllers.accountUpdatePost)


module.exports = router
