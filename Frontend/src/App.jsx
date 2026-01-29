import React from 'react'
import NavBar from './Components/NavBar'
import LandingPage from './Pages/LandingPage'
import HomePage from './Pages/HomePage'
import BottomNavigation from './Components/BottomNavigation'
import {BrowserRouter as Router,Routes,Route} from 'react-router-dom'
import LoginPage from './Pages/LoginPage'
import ProfilePage from './Pages/ProfilePage'
import Register from './Components/Register'


const App = () => {
  return (
 <>
 
 <Router>


  <Routes>

    <Route path='/' element={<HomePage/>}/>
    <Route path='/Login' element={<LoginPage/>}/>
    <Route path='/Profile' element={<ProfilePage/>}/>
    <Route path='/Register' element={<Register/>}/>
  </Routes>
 </Router>
 
 
 
 </>
  )
}

export default App