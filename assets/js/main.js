/**
 * OIC Bielefeld - Main JavaScript
 * Handles animations, scroll effects, and interactions
 */

(function() {
    'use strict';

    // DOM Elements
    const navbar = document.getElementById('navbar');
    const heroSection = document.getElementById('hero');
    
    // Initialize when DOM is ready
    document.addEventListener('DOMContentLoaded', function() {
        initNavbar();
        initScrollAnimations();
        initSmoothScrolling();
        initParallaxEffects();
        initTeamCardAnimations();
        initProjectCardAnimations();
    });

    /**
     * Navbar scroll effects
     */
    function initNavbar() {
        let isScrolled = false;
        
        window.addEventListener('scroll', function() {
            const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
            
            if (scrollTop > 50 && !isScrolled) {
                navbar.classList.add('scrolled');
                isScrolled = true;
            } else if (scrollTop <= 50 && isScrolled) {
                navbar.classList.remove('scrolled');
                isScrolled = false;
            }
        });
    }

    /**
     * Intersection Observer for scroll animations
     */
    function initScrollAnimations() {
        const observerOptions = {
            threshold: 0.1,
            rootMargin: '0px 0px -50px 0px'
        };

        const observer = new IntersectionObserver(function(entries) {
            entries.forEach(function(entry) {
                if (entry.isIntersecting) {
                    entry.target.classList.add('visible');
                    
                    // Add staggered animation for team cards
                    if (entry.target.classList.contains('team-card')) {
                        const delay = entry.target.dataset.delay || 0;
                        setTimeout(function() {
                            entry.target.style.transitionDelay = delay + 's';
                        }, delay * 100);
                    }
                }
            });
        }, observerOptions);

        // Observe all animated elements
        const animatedElements = document.querySelectorAll(
            '.fade-in, .principle-card, .team-card, .project-card, .contact-card'
        );
        
        animatedElements.forEach(function(element, index) {
            // Add staggered delays for cards
            if (element.classList.contains('team-card') || 
                element.classList.contains('project-card')) {
                element.dataset.delay = (index * 0.1).toFixed(1);
            }
            
            observer.observe(element);
        });
    }

    /**
     * Smooth scrolling for navigation links
     */
    function initSmoothScrolling() {
        const navLinks = document.querySelectorAll('a[href^="#"]');
        
        navLinks.forEach(function(link) {
            link.addEventListener('click', function(e) {
                e.preventDefault();
                
                const targetId = this.getAttribute('href');
                const targetElement = document.querySelector(targetId);
                
                if (targetElement) {
                    const offsetTop = targetElement.offsetTop - 80; // Account for fixed navbar
                    
                    window.scrollTo({
                        top: offsetTop,
                        behavior: 'smooth'
                    });
                }
            });
        });
    }

    /**
     * Parallax effects for hero section
     */
    function initParallaxEffects() {
        const heroBackground = document.querySelector('.hero-bg');
        const graffitiOverlay = document.querySelector('.graffiti-overlay');
        
        if (!heroBackground && !graffitiOverlay) return;
        
        let ticking = false;
        
        function updateParallax() {
            const scrolled = window.pageYOffset;
            const rate = scrolled * -0.5;
            
            if (heroBackground) {
                heroBackground.style.transform = `translateY(${rate}px)`;
            }
            
            if (graffitiOverlay) {
                const graffitiRate = scrolled * -0.3;
                graffitiOverlay.style.transform = `translateY(calc(-50% + ${graffitiRate}px))`;
            }
            
            ticking = false;
        }
        
        function requestTick() {
            if (!ticking) {
                requestAnimationFrame(updateParallax);
                ticking = true;
            }
        }
        
        window.addEventListener('scroll', requestTick);
    }

    /**
     * Enhanced team card animations
     */
    function initTeamCardAnimations() {
        const teamCards = document.querySelectorAll('.team-card');
        
        teamCards.forEach(function(card, index) {
            // Add hover effects for expertise items
            const expertiseItems = card.querySelectorAll('.expertise-list li');
            
            expertiseItems.forEach(function(item) {
                item.addEventListener('mouseenter', function() {
                    this.style.transform = 'translateX(5px)';
                });
                
                item.addEventListener('mouseleave', function() {
                    this.style.transform = 'translateX(0)';
                });
            });
            
            // Add card flip effect on click (optional)
            card.addEventListener('click', function() {
                this.style.transform = 'scale(0.95)';
                setTimeout(() => {
                    this.style.transform = '';
                }, 150);
            });
        });
    }

    /**
     * Project card interactions
     */
    function initProjectCardAnimations() {
        const projectCards = document.querySelectorAll('.project-card');
        
        projectCards.forEach(function(card) {
            const tag = card.querySelector('.project-tag');
            
            card.addEventListener('mouseenter', function() {
                if (tag) {
                    tag.style.transform = 'scale(1.1) rotate(-2deg)';
                }
            });
            
            card.addEventListener('mouseleave', function() {
                if (tag) {
                    tag.style.transform = 'scale(1) rotate(0deg)';
                }
            });
        });
    }

    /**
     * Utility function to debounce scroll events
     */
    function debounce(func, wait, immediate) {
        let timeout;
        return function() {
            const context = this;
            const args = arguments;
            const later = function() {
                timeout = null;
                if (!immediate) func.apply(context, args);
            };
            const callNow = immediate && !timeout;
            clearTimeout(timeout);
            timeout = setTimeout(later, wait);
            if (callNow) func.apply(context, args);
        };
    }

    /**
     * Add loading animation for images
     */
    function initImageLoading() {
        const images = document.querySelectorAll('.team-image');
        
        images.forEach(function(img) {
            img.addEventListener('load', function() {
                this.style.opacity = '1';
            });
            
            img.addEventListener('error', function() {
                // Fallback to placeholder if image fails to load
                const placeholder = this.nextElementSibling;
                if (placeholder && placeholder.classList.contains('team-placeholder')) {
                    this.style.display = 'none';
                    placeholder.style.display = 'flex';
                }
            });
        });
    }

    /**
     * Mobile menu toggle (if needed)
     */
    function initMobileMenu() {
        const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
        const navLinks = document.querySelector('.nav-links');
        
        if (mobileMenuBtn && navLinks) {
            mobileMenuBtn.addEventListener('click', function() {
                navLinks.classList.toggle('show');
                this.innerHTML = navLinks.classList.contains('show') ? '✕' : '☰';
            });
        }
    }

    /**
     * Add subtle animations to contact cards
     */
    function initContactAnimations() {
        const contactCards = document.querySelectorAll('.contact-card');
        
        contactCards.forEach(function(card, index) {
            card.style.animationDelay = (index * 0.1) + 's';
            
            card.addEventListener('mouseenter', function() {
                this.style.transform = 'translateY(-5px) scale(1.02)';
            });
            
            card.addEventListener('mouseleave', function() {
                this.style.transform = 'translateY(0) scale(1)';
            });
        });
    }

    /**
     * Initialize all contact animations when DOM is ready
     */
    document.addEventListener('DOMContentLoaded', function() {
        initImageLoading();
        initMobileMenu();
        initContactAnimations();
    });

    /**
     * Add window resize handler for responsive adjustments
     */
    window.addEventListener('resize', debounce(function() {
        // Recalculate parallax effects on resize
        if (window.innerWidth <= 768) {
            // Disable parallax on mobile for performance
            const heroBackground = document.querySelector('.hero-bg');
            if (heroBackground) {
                heroBackground.style.transform = '';
            }
        }
    }, 250));

    /**
     * Add smooth transitions when page loads
     */
    window.addEventListener('load', function() {
        document.body.classList.add('loaded');
        
        // Trigger hero animations
        const heroContent = document.querySelector('.hero-content');
        if (heroContent) {
            heroContent.classList.add('animate');
        }
    });

    /**
     * Add keyboard navigation support
     */
    document.addEventListener('keydown', function(e) {
        // Escape key to close mobile menu
        if (e.key === 'Escape') {
            const navLinks = document.querySelector('.nav-links');
            const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
            
            if (navLinks && navLinks.classList.contains('show')) {
                navLinks.classList.remove('show');
                if (mobileMenuBtn) {
                    mobileMenuBtn.innerHTML = '☰';
                }
            }
        }
    });

})();

/**
 * Events Section JavaScript
 * Add to existing main.js file
 */

/**
 * Enhanced event card animations
 */
function initEventAnimations() {
    const eventCards = document.querySelectorAll('.event-card');
    
    eventCards.forEach(function(card, index) {
        // Staggered animation delay
        card.style.animationDelay = (index * 0.1) + 's';
        
        // Enhanced hover effects
        card.addEventListener('mouseenter', function() {
            const bookBtn = this.querySelector('.event-book-btn');
            if (bookBtn) {
                bookBtn.style.transform = 'translateY(-2px) scale(1.05)';
            }
        });
        
        card.addEventListener('mouseleave', function() {
            const bookBtn = this.querySelector('.event-book-btn');
            if (bookBtn) {
                bookBtn.style.transform = 'translateY(0) scale(1)';
            }
        });
        
        // Track clicks for analytics (optional)
        const bookBtn = card.querySelector('.event-book-btn');
        if (bookBtn) {
            bookBtn.addEventListener('click', function() {
                // Add analytics tracking here if needed
                console.log('Event booking clicked:', card.querySelector('.event-title').textContent);
            });
        }
    });
}

/**
 * Date formatting and validation for events
 */
function initEventDateHandling() {
    const eventCards = document.querySelectorAll('.event-card');
    const today = new Date();
    
    eventCards.forEach(function(card) {
        const dateElement = card.querySelector('[data-date]');
        if (dateElement) {
            const eventDate = new Date(dateElement.dataset.date);
            
            // Add "heute" or "morgen" labels
            const diffTime = eventDate - today;
            const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
            
            if (diffDays === 0) {
                dateElement.innerHTML += ' <span style="color: var(--secondary-pink); font-weight: 600;">(Heute!)</span>';
            } else if (diffDays === 1) {
                dateElement.innerHTML += ' <span style="color: var(--secondary-green); font-weight: 600;">(Morgen)</span>';
            } else if (diffDays <= 7) {
                dateElement.innerHTML += ` <span style="color: var(--primary-turquoise); font-weight: 600;">(in ${diffDays} Tagen)</span>`;
            }
        }
    });
}

/**
 * Event filtering by category (optional future feature)
 */
function initEventFiltering() {
    // This can be extended later if you want category filtering
    const categories = ['Alle', 'Workshop', 'Dialog', 'Networking', 'Hackathon', 'Vortrag'];
    
    // You could add filter buttons here in the future
    // For now, just log available categories
    console.log('Available event categories:', categories);
}

/**
 * Smooth scroll to events section when coming from external links
 */
function initEventDeepLinking() {
    // Check if URL contains #events
    if (window.location.hash === '#events') {
        setTimeout(function() {
            const eventsSection = document.getElementById('events');
            if (eventsSection) {
                eventsSection.scrollIntoView({ behavior: 'smooth' });
            }
        }, 500);
    }
}

/**
 * Initialize all event-related functionality
 */
document.addEventListener('DOMContentLoaded', function() {
    initEventAnimations();
    initEventDateHandling();
    initEventFiltering();
    initEventDeepLinking();
});

/**
 * Add events section to existing intersection observer
 * (modify existing initScrollAnimations function in main.js)
 */
// Add this to your existing observer in main.js:
// document.querySelectorAll('.fade-in, .principle-card, .team-card, .project-card, .event-card').forEach(...)

/**
 * Event card entrance animations with intersection observer
 */
function initEventScrollAnimations() {
    const eventObserver = new IntersectionObserver(function(entries) {
        entries.forEach(function(entry, index) {
            if (entry.isIntersecting) {
                // Staggered animation
                setTimeout(function() {
                    entry.target.classList.add('visible');
                }, index * 100);
            }
        });
    }, {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    });

    document.querySelectorAll('.event-card').forEach(function(card) {
        eventObserver.observe(card);
    });
}
