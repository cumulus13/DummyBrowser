# Inno Setup Image Specifications

## Modern Wizard Style (WizardStyle=modern)

### WizardImageFile (Background Image)
- **Ukuran:** `497 x 314` pixels
- **Format:** BMP (24-bit atau 32-bit)
- **Lokasi:** Tampil di sisi kanan wizard
- **Fungsi:** Background image untuk halaman wizard
- **Recommended:** Gunakan warna yang soft/gradient agar teks tetap readable

### WizardSmallImageFile (Small Logo)
- **Ukuran:** `55 x 55` pixels
- **Format:** BMP (24-bit atau 32-bit dengan alpha channel)
- **Lokasi:** Corner kiri atas wizard
- **Fungsi:** Small logo/icon aplikasi
- **Recommended:** Logo sederhana dengan background transparan

## Classic Wizard Style (WizardStyle=classic) - Legacy

### WizardImageFile
- **Ukuran:** `164 x 314` pixels
- **Format:** BMP
- **Lokasi:** Sisi kiri wizard

### WizardSmallImageFile  
- **Ukuran:** `55 x 55` pixels
- **Format:** BMP
- **Lokasi:** Header wizard

## Setup Icon

### SetupIconFile
- **Ukuran:** `32x32, 48x48, 256x256` pixels (multi-size ICO)
- **Format:** ICO file
- **Fungsi:** Icon untuk installer executable

## Color Recommendations

### WizardImageFile (497x314)
- **Background:** Gradient atau solid color yang tidak terlalu kontras
- **Colors:** Blue gradients, soft grays, atau brand colors
- **Avoid:** High contrast patterns yang bisa mengganggu readability teks

### WizardSmallImageFile (55x55)
- **Style:** Simple, clean logo
- **Background:** Transparan atau solid yang match dengan theme
- **Detail:** Avoid fine details karena ukuran kecil

## File Naming Convention
```
assets/
├── setup_icon.ico          # 32x32, 48x48, 256x256
├── wizard_image.bmp         # 497x314 
└── wizard_small.bmp         # 55x55
```

## Creation Tools
- **Photoshop/GIMP:** Untuk create custom images
- **Online Tools:** Canva, Figma untuk quick designs
- **Icon Tools:** IcoFX, IconWorkshop untuk ICO files
- **Templates:** Banyak free templates available online

## Example Template Sizes Verification
```pascal
; Verify dalam ISS file:
WizardImageFile=assets\wizard_image.bmp     ; Must be 497x314
WizardSmallImageFile=assets\wizard_small.bmp ; Must be 55x55
SetupIconFile=assets\setup_icon.ico          ; Multi-size ICO
```