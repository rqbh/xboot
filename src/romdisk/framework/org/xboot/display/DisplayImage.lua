---
-- The 'DisplayImage' class is used to display texture related objects that can
-- be placed on the screen.
--
-- @module DisplayImage
local M = Class(DisplayObject)

---
-- Creates a new object of display image.
--
-- @function [parent=#DisplayImage] new
-- @param texture (Texture) The texture object
-- @param x (optional) The x coordinate of the display image.
-- @param y (optional) The y coordinate of the display image.
-- @return #DisplayImage
function M:init(texture, x, y)
	self.super:init()

	self:setTexture(texture)
	self:setPosition(x or 0, y or 0)
end

---
-- Attach texture to display image.
--
-- @function [parent=#DisplayImage] setTexture
-- @param self
-- @param texture (Texture) The texture object
function M:setTexture(texture)
	if texture then
		local w, h = texture:size()
		self.texture = texture
		self:setInnerSize(w, h)
	end
	return self
end

---
-- Get texture of display image.
--
-- @function [parent=#DisplayImage] getTexture
-- @param self
-- @return The texture object of display image.
function M:getTexture()
	return self.texture
end

---
-- Draw display image to the screen. (subclasses method)
--
-- @function [parent=#DisplayImage] __draw
-- @param self
-- @param display (Display) The context of the screen.
function M:__draw(display)
	display:drawTexture(self.texture, self:getTransformMatrix(), self:getAlpha())
end

return M
