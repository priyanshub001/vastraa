import React from 'react'
import NavBar from '../Components/NavBar'
import homeimg from '../assets/home_img.jpg'
import mens_logo from '../assets/mens_logo.jpeg'
import womens_logo from '../assets/womens_logo.jpeg'

const HomePage = () => {
  return (
    <>
    <NavBar   />

    <div className='flex flex-col items-center justify-center  h-[calc(100vh-5rem)]  w-full bg-bottom bg-contain bg-no-repeat     '  style={{
    backgroundImage: `url(${homeimg})`, 
    backgroundColor:"#ffdf00 ",
    
  }}> 
  
   <div className="-translate-y-1/5  ">
   <div className='flex flex-col justify-center items-center mb-10'> 
    <p className='text-4xl '>Vastraa</p>
    <p className='text-4xl '>shop for </p>
  </div>
  
  <div className='flex lg:gap-10 gap-2' >
    <div  className='border-black border-2  h-40vh w-30vh lg:h-60vh lg:w-40vh flex flex-col items-center justify-center bg-white'>
      <img src={mens_logo} className='w-full h-30 lg:h-55' />
      <p className='text-3xl'>Mens</p>
    </div>
    <div  className='border-black border-2 w-30vh h-40vh  lg:h-60vh lg:w-40vh flex flex-col items-center justify-center bg-white '>
      <img src={womens_logo}  className='w-full h-30 lg:h-55'/>
      <p className='text-3xl  '>Womens</p>
    </div>
  </div>
   
  </div>

  
  
    
    </div>
   
    </>
  )
}

export default HomePage