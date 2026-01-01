import React, { useState, useRef, useEffect } from "react";
import hoodie from '../assets/Airport hoodie.jpg'
import classic from '../assets/classic fit.webp'
import denim from '../assets/denim.webp'
import jogger from '../assets/jogger.webp'
import mood from '../assets/mood for.webp'
import oversized from '../assets/oversized tshirt.webp'
import shirt from '../assets/shirts.jpg'
import stranger from '../assets/stranger things.jpg'
import winter from '../assets/winter wear.jpg'

const MensPage = () => {
  const images = [
    hoodie,
    classic,
    denim,
    jogger,
    mood,
    oversized,
    shirt,
    stranger,
    winter
  ];

  const [current, setCurrent] = useState(1);
  const [isMobile, setIsMobile] = useState(false);

  /* 🔥 detect screen size (ADDED) */
  useEffect(() => {
    const checkScreen = () => {
      setIsMobile(window.innerWidth < 768);
    };

    checkScreen();
    window.addEventListener("resize", checkScreen);
    return () => window.removeEventListener("resize", checkScreen);
  }, []);

  const GAP = 24;

  const ITEM_WIDTH = isMobile
    ? window.innerWidth - 32
    : window.innerWidth / 3 - GAP;

  const VISIBLE_CENTER = isMobile ? 0 : 1;

  const translateX =
    -(current - VISIBLE_CENTER) * (ITEM_WIDTH + GAP);

  /* Swipe logic */
  const touchStartX = useRef(0);
  const touchEndX = useRef(0);

  const handleTouchStart = (e) => {
    touchStartX.current = e.touches[0].clientX;
  };

  const handleTouchMove = (e) => {
    touchEndX.current = e.touches[0].clientX;
  };

  const handleTouchEnd = () => {
    const swipeDistance = touchStartX.current - touchEndX.current;

    if (swipeDistance > 50 && current < images.length - (isMobile ? 1 : 2)) {
      setCurrent((prev) => prev + 1);
    } else if (swipeDistance < -50 && current > (isMobile ? 0 : 1)) {
      setCurrent((prev) => prev - 1);
    }
  };

  /* 🔥 AUTO SLIDE (unchanged logic, responsive bounds) */
  useEffect(() => {
    const interval = setInterval(() => {
      setCurrent((prev) =>
        prev < images.length - (isMobile ? 1 : 2)
          ? prev + 1
          : isMobile ? 0 : 1
      );
    }, 3000);

    return () => clearInterval(interval);
  }, [images.length, isMobile]);

  return (
    <div className="w-full overflow-hidden">
      {/* Carousel */}
      <div
        className="w-full overflow-hidden px-4"
        onTouchStart={handleTouchStart}
        onTouchMove={handleTouchMove}
        onTouchEnd={handleTouchEnd}
      >
        <div
          className="flex items-center transition-transform duration-500 ease-in-out"
          style={{
            transform: `translateX(${translateX}px)`,
            gap: `${GAP}px`,
          }}
        >
          {images.map((src, index) => (
            <div
              key={index}
              className={`flex-shrink-0 transition-all duration-500
                ${
                  index === current
                    ? "scale-105 opacity-100"
                    : "scale-95 opacity-60"
                }
              `}
              style={{ width: ITEM_WIDTH }}
            >
              <img
                src={src}
                alt={`mens-${index}`}
                className="w-full h-fit object-cover rounded-xl"
              />
            </div>
          ))}
        </div>
      </div>

      {/* Dots */}
      <div className="flex justify-center gap-2 mt-6">
        {images.map((_, index) => (
          <button
            key={index}
            onClick={() => setCurrent(index)}
            className={`h-2.5 rounded-full transition-all duration-300
              ${current === index ? "w-6 bg-black" : "w-2.5 bg-gray-400"}
            `}
          />
        ))}
      </div>
    </div>
  );
};

export default MensPage;
