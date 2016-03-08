require 'rqrcode'

qrcode = RQRCode::QRCode.new("121.5164856, 25.046408 to 121.4609185, 25.079837")
png = qrcode.as_png(
          resize_gte_to: false,
          resize_exactly_to: false,
          fill: 'white',
          color: 'black',
          size: 300,
          border_modules: 4,
          module_px_size: 6,
          file: 'qrcode.png'
          )