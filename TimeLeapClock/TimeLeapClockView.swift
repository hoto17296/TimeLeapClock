import ScreenSaver

class TimeLeapClockView: ScreenSaverView {
    
    let dateFormatter = DateFormatter()
    var textRect: NSRect!
    var textAttributes: [String: Any] = [:]
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setAttributes()
    }
    
    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
        self.setAttributes()
    }
    
    func setAttributes() {
        let w = self.bounds.size.width
        let h = self.bounds.size.height
        
        self.dateFormatter.dateFormat = "yy:MM:dd:HH:mm:ss:SS"
        
        let fontSize = w / CGFloat(self.dateFormatter.dateFormat.count - 1)
        self.textRect = NSMakeRect(0, 0, w, h / 2 + fontSize)
        
        let shadow = NSShadow()
        shadow.shadowColor = NSColor.red
        shadow.shadowBlurRadius = fontSize / 4.0
        self.textAttributes = [
            NSFontAttributeName: NSFont(name: "TimeLeap", size: fontSize),
            NSForegroundColorAttributeName: NSColor.red,
            NSShadowAttributeName: shadow,
        ]
    }
    
    override func animateOneFrame() {
        NSBezierPath(rect: self.bounds).fill()
        let text = self.dateFormatter.string(from: Date())
        text.draw(in: self.textRect, withAttributes: self.textAttributes)
    }
    
}
