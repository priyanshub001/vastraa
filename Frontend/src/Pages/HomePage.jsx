import React from 'react'
import NavBar from '../Components/NavBar'
import ToggleContent from '../Components/ToggleContent'
import BottomNavigation from '../Components/BottomNavigation'

const HomePage = () => {
  return (

    <>
    <div className='flex flex-col gap-5 '>
    <div className='fixed w-full z-50'>
       <NavBar/>
    </div>

    
    <div className='h-screen  bg-white w-full mt-20'> 

        <ToggleContent/>


    
    </div>
    <div className=' fixed  z-50  w-full  bottom-0 left-0 lg:hidden '>

  <BottomNavigation/> 
</div>
    </div>


    
    </>
  
  
  )
}

export default HomePage