# Simple script untuk membuat Inno Setup images tanpa font issues
from PIL import Image, ImageDraw
import os
from rich.console import Console
console = Console()

def create_wizard_image():
    """Create wizard background image (497x314)"""
    img = Image.new('RGB', (497, 314), color='white')
    draw = ImageDraw.Draw(img)
    
    # Create blue gradient background
    for y in range(314):
        intensity = int(240 - (y * 80 / 314))
        color = (intensity, intensity + 10, 255)
        draw.line([(0, y), (497, y)], fill=color)
    
    # Add geometric shapes for decoration
    # Large circle
    draw.ellipse([350, 50, 450, 150], fill=(255, 255, 255, 50), outline='white', width=3)
    
    # Small circles
    draw.ellipse([300, 200, 320, 220], fill='white', outline='lightgray')
    draw.ellipse([420, 180, 440, 200], fill='white', outline='lightgray')
    
    # Rectangle accent
    draw.rectangle([20, 250, 200, 270], fill='white', outline='lightgray', width=2)
    
    return img

def create_wizard_small():
    """Create small wizard icon (55x55)"""
    img = Image.new('RGBA', (55, 55), color=(70, 130, 255, 255))  # Blue background
    draw = ImageDraw.Draw(img)
    
    # Create rounded corners effect
    corner_radius = 8
    draw.rectangle([corner_radius, 0, 55-corner_radius, 55], fill=(70, 130, 255))
    draw.rectangle([0, corner_radius, 55, 55-corner_radius], fill=(70, 130, 255))
    
    # Draw clipboard icon in white
    # Clipboard body
    draw.rectangle([15, 12, 40, 43], fill='white', outline='lightgray', width=1)
    
    # Clipboard clip
    draw.rectangle([22, 8, 33, 15], fill='lightgray', outline='gray', width=1)
    
    # Document lines
    for i in range(3):
        y = 18 + (i * 6)
        draw.line([18, y, 37, y], fill='lightblue', width=2)
    
    # Add a small copy symbol (C)
    draw.ellipse([32, 32, 45, 45], fill='orange', outline='darkorange', width=1)
    draw.text((36, 35), "C", fill='white')
    
    return img

def create_simple_icon():
    """Create simple setup icon (32x32)"""
    img = Image.new('RGBA', (32, 32), color=(0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    # Blue background circle
    draw.ellipse([2, 2, 30, 30], fill=(70, 130, 255), outline=(50, 100, 200), width=2)
    
    # Simple clipboard shape
    draw.rectangle([8, 6, 24, 26], fill='white', outline='lightgray', width=1)
    draw.rectangle([12, 4, 20, 8], fill='lightgray', outline='gray', width=1)
    
    # Simple lines
    draw.line([10, 12, 22, 12], fill='blue', width=1)
    draw.line([10, 16, 22, 16], fill='blue', width=1)
    draw.line([10, 20, 18, 20], fill='blue', width=1)
    
    return img

def main():
    # Create assets directory if it doesn't exist
    if not os.path.exists('assets'):
        os.makedirs('assets')
        print("Created assets directory")
    
    print("Creating Inno Setup images...")
    
    try:
        # Create wizard background image (497x314)
        if not os.path.isfile('assets/wizard_image.bmp'):
            wizard_img = create_wizard_image()
            wizard_img.save('assets/wizard_image.bmp', 'BMP')
            console.print("[NEW] Created wizard_image.bmp (497x314)")
        else:
            console.print("[EXISTS] Created wizard_image.bmp (497x314)")
        
        # Create small wizard icon (55x55)  
        if not os.path.isfile('assets/wizard_small.bmp'):
            small_img = create_wizard_small()
            small_img.save('assets/wizard_small.bmp', 'BMP')
            console.print("[NEW] Created wizard_small.bmp (55x55)")
        else:
            console.print("[EXISTS] Created wizard_small.bmp (55x55)")
        
        # Create setup icon (32x32)
        icon_img = create_simple_icon()
        icon_img.save('assets/setup_icon_32.bmp', 'BMP')
        try:
            console.print(":heavy_check_mark: Created setup_icon_32.bmp (32x32)")
        except Exception as e:
            console.print("Created setup_icon_32.bmp (32x32)")
        
        try:
            console.print("\n:party_popper: All images created successfully!")
        except Exception as e:
            console.print("\n All images created successfully!")
        print("\nFiles created:")
        print("  - assets/wizard_image.bmp (497x314) - Background image")
        print("  - assets/wizard_small.bmp (55x55) - Small logo")
        print("  - assets/setup_icon_32.bmp (32x32) - Setup icon")
        
        print("\nNote: For ICO file, you can:")
        print("1. Use online converter: convertio.co/bmp-ico")
        print("2. Or rename .bmp to .ico for simple cases")
    
    except UnicodeEncodeError:
        pass
    except Exception as e:
        if 'charmap' in str(e):
            pass
        else:
            try:
                console.print(f":cross_mark: Error creating images: {e}")
            except Exception as e:
                console.print(f"Error creating images: {e}")
            return False
    return True
    return True

if __name__ == "__main__":
    main()