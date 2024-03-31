const loginRouter = require('./client/login.routes')
//Client Controller
const homeRouter = require('./client/home.routes')
const registerRouter = require('./client/Register.routes')
const historyRouter = require('./client/History.routes')
const myInterestingBookRouter = require('./client/MyInterestingBook.routes')
const paymentRouter = require('./client/Payment.routes')
const viewProfileRouter = require('./client/ViewProfile.routes')
const ChangePasswordUserRouter = require('./client/ChangePasswordUser.routes')
const accountUpdateRouter = require('./client/AccountUpdate.routes')



//Librarian Controller
const accountUpdateLibrarianRouter = require('./librarian/AccountUpdateLibrarian.routes')
const add_book_librarianRouter = require('./librarian/Add_book_librarian.routes')
const dashboardLibrarianRouter = require('./librarian/DashboardLibrarian.routes')
const librarianViewHistoryClientRouter = require('./librarian/LibrarianViewHistoryClient.routes')
const UpdateBookLibrarianRouter = require('./librarian/UpdateBookLibrarian.routes')
const ViewBookInforLibrarianRouter = require('./librarian/ViewBookInforLibrarian.routes')
const ViewBookLibrarianRouter = require('./librarian/ViewBookLibrarian.routes')
const ViewClientRouter = require('./librarian/ViewClient.routes')
const ViewProfileLibrarianRouter = require('./librarian/ViewProfileLibrarian.routes')
const ChangePassWordLibrarianRouter = require('./librarian/ChangePassWordLibrarian.routes')
const ConfirmReturnLibrarianRouter = require('./librarian/ConfirmReturnLibrarian.routes')
//Admin Controller
const Admin_add_librarianRouter = require('./admin/Admin_add_librarian.routes')
const Admin_add_clientRouter = require('./admin/Admin_add_client.routes')
const Add_book_adminRouter = require('./admin/Add_book_admin.routes')
const AdminChangePasswordRouter = require('./admin/AdminChangePassword.routes')
const AdminChangePassWordLibrarianRouter = require('./librarian/ChangePassWordLibrarian.routes')
const AdminChangePasswordUserRouter = require('./admin/AdminChangePasswordUser.routes')
const AdminAccountUpdateRouter = require('./admin/AdminAccountUpdate.routes')
const AdminAccountUpdateLibrarianRouter = require('./admin/AdminAccountUpdateLibrarian.routes')
const UpdateBookAdminRouter = require('./admin/UpdateBookAdmin.routes')
const AdminViewBookRouter = require('./admin/AdminViewBook.routes')
const AdminViewBookInforRouter = require('./admin/AdminViewBookInfor.routes')
const AdminViewClientRouter = require('./admin/AdminViewClient.routes')
const AdminViewClientProfileRouter = require('./admin/AdminViewClientProfile.routes')
const AdminViewLibrarianRouter = require('./admin/AdminViewLibrarian.routes')
const AdminViewProfileLibrarianRouter = require('./admin/AdminViewProfileLibrarian.routes')
const AdminViewAdminProfileRouter = require('./admin/AdminViewAdminProfile.routes')
const Statistic_AdminRouter = require('./admin/Statistic_Admin.routes')


function route(app) {
    
    app.use('/', loginRouter)
    
    app.use('/Register', registerRouter)
    
//route client
    app.use('/home', homeRouter); 

    app.get('/erro', (req, res)=>{
        res.send('<h1>erro</h1>')
    })

    app.use('/History', historyRouter)
    app.use('/MyInterestingBook', myInterestingBookRouter)
    app.use('/Payment', paymentRouter)
    app.use('/ViewProfile', viewProfileRouter)
    app.use('/ChangePasswordUser', ChangePasswordUserRouter)

    
// route Libraian    
    app.use('/AccountUpdate', accountUpdateRouter)
    app.use('/AccountUpdateLibrarian', accountUpdateLibrarianRouter)
    app.use('/Add_book_librarian', add_book_librarianRouter)
    app.use('/DashboardLibrarian', dashboardLibrarianRouter)
    app.use('/LibrarianViewHistoryClient', librarianViewHistoryClientRouter)
    app.use('/UpdateBookLibrarian', UpdateBookLibrarianRouter)
    app.use('/ViewBookInforLibrarian', ViewBookInforLibrarianRouter)
    app.use('/ViewBookLibrarian', ViewBookLibrarianRouter)
    app.use('/ViewClient', ViewClientRouter)
    app.use('/ViewProfileLibrarian', ViewProfileLibrarianRouter)
    app.use('/ChangePassWordLibrarian', ChangePassWordLibrarianRouter)
    app.use('/ConfirmReturnLibrarian', ConfirmReturnLibrarianRouter)


//route Admin
    app.use('/Add_book_admin', Add_book_adminRouter)
    app.use('/AdminChangePassword', AdminChangePasswordRouter)
    app.use('/AdminChangePassWordLibrarian', AdminChangePassWordLibrarianRouter)
    app.use('/AdminChangePasswordUser', AdminChangePasswordUserRouter)
    app.use('/AdminAccountUpdate', AdminAccountUpdateRouter)
    app.use('/AdminAccountUpdateLibrarian', AdminAccountUpdateLibrarianRouter)
    app.use('/UpdateBookAdmin', UpdateBookAdminRouter)
    app.use('/AdminViewBook', AdminViewBookRouter)
    app.use('/AdminViewBookInfor', AdminViewBookInforRouter)
    app.use('/AdminViewClient', AdminViewClientRouter)
    app.use('/AdminViewClientProfile', AdminViewClientProfileRouter)
    app.use('/AdminViewLibrarian', AdminViewLibrarianRouter)
    app.use('/AdminViewProfileLibrarian', AdminViewProfileLibrarianRouter)
    app.use('/AdminViewAdminProfile', AdminViewAdminProfileRouter)
    app.use('/Statistic_Admin', Statistic_AdminRouter)
    app.use('/Admin_add_client', Admin_add_clientRouter)
    app.use('/Admin_add_librarian', Admin_add_librarianRouter)
    app.get('/setSession', (req, res)=>{
        req.session.user = {
            username: 'loc'
        }
        res.send('okk')
    })
    app.get('/getSession', (req, res)=>{
        res.send(req.session)
    })

}

module.exports = route;
