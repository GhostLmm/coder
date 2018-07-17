public function render_a_character(_posX:Number,_posY:Number,_posX_old:Number,_posY_old:Number,_anim:int,_frame:int,_frameOld:int,_face:int,
 public function render_a_character(_posX:*,   _posY:*,    _posX_old:*,        _posY_old:*,        _anim:*, _frame:*,    _frameOld:*,   _face:*, 
										   _gunRot:Number,_gunRotOld:Number,_headRot:Number,_gunX:Number,_gunY:Number,_gunXOld:Number,_gunYOld:Number,
										   _gunRot:*,     _gunRotOld:*,        _headRot:*,       _gunX:*,   _gunY:*,   _gunXOld:*,      _gunYOld:*, 
										   _gunEquipped:int,_gunFrame:int,_spriteSet:int,_headless:Boolean,_reloadTime:int)
										   _gunEquipped:*,      _gunFrame:*,     _spriteSet:*,     _headless:*,       _reloadTime:*)

 public function render_a_character(_posX:*,   _posY:*,    _posX_old:*,        _posY_old:*,        _anim:*, _frame:*,    _frameOld:*,   _face:*, 
										   _gunRot:*,     _gunRotOld:*,        _headRot:*,       _gunX:*,   _gunY:*,   _gunXOld:*,      _gunYOld:*, 
										   _gunEquipped:*,      _gunFrame:*,     _spriteSet:*,     _headless:*,       _reloadTime:*)
        

		{
			interpFun(_gunRot, 0, _gunRotOld, 0);
			rotInterp = interpFinal.x;
			interpFun(_frame, 0, _frameOld, 0);
			interpFrame = interpFinal.x;
			if (_face == 0){
				interpFun(_posX, _posY, _posX_old, _posY_old);
				if (_charAnimData.hasHands == 1){
					trans.createBox(1, 1, _charAnimData.hand1_r[int(interpFrame)], (interpFinal.x + _charAnimData.hand1_x[int(interpFrame)]), (interpFinal.y + _charAnimData.hand1_y[int(interpFrame)]));
					bm.draw(_charAsset.char_hand1, trans);
				};
				trans.createBox(1, 1, _charAnimData.foot2_r[int(interpFrame)], (interpFinal.x + _charAnimData.foot2_x[int(interpFrame)]), (interpFinal.y + _charAnimData.foot2_y[int(interpFrame)]));
				bm.draw(_charAsset.char_foot, trans);
				trans.createBox(1, 1, _charAnimData.ankle2_r[int(interpFrame)], (interpFinal.x + _charAnimData.ankle2_x[int(interpFrame)]), (interpFinal.y + _charAnimData.ankle2_y[int(interpFrame)]));
				bm.draw(_charAsset.char_ankle, trans);
				trans.createBox(1, 1, _charAnimData.body_r[int(interpFrame)], (interpFinal.x + _charAnimData.body_x[int(interpFrame)]), (interpFinal.y + _charAnimData.body_y[int(interpFrame)]));
				bm.draw(_charAsset.char_body, trans);
				if (_charAnimData.headRot == 0){
					tempHeadRot = _headRot;
					if (tempHeadRot < -0.75){
						tempHeadRot = -0.75;
					}
					else {
						if (tempHeadRot > 0.5){
							tempHeadRot = 0.5;
						};
					};
					trans.createBox(1, 1, tempHeadRot, (interpFinal.x + _charAnimData.head_x[int(interpFrame)]), (interpFinal.y + _charAnimData.head_y[int(interpFrame)]));
				}
				else {
					trans.createBox(1, 1, _charAnimData.head_r[int(interpFrame)], (interpFinal.x + _charAnimData.head_x[int(interpFrame)]), (interpFinal.y + _charAnimData.head_y[int(interpFrame)]));
				};
				if (_headless == false){
					bm.draw(_charAsset.char_head, trans);
				};
				trans.createBox(1, 1, _charAnimData.foot1_r[int(interpFrame)], (interpFinal.x + _charAnimData.foot1_x[int(interpFrame)]), (interpFinal.y + _charAnimData.foot1_y[int(interpFrame)]));
				bm.draw(_charAsset.char_foot, trans);
				trans.createBox(1, 1, _charAnimData.ankle1_r[int(interpFrame)], (interpFinal.x + _charAnimData.ankle1_x[int(interpFrame)]), (interpFinal.y + _charAnimData.ankle1_y[int(interpFrame)]));
				bm.draw(_charAsset.char_ankle, trans);
				if (_charAnimData.hasHands == 1){
					trans.createBox(1, 1, _charAnimData.hand2_r[int(interpFrame)], (interpFinal.x + _charAnimData.hand2_x[int(interpFrame)]), (interpFinal.y + _charAnimData.hand2_y[int(interpFrame)]));
					bm.draw(_charAsset.char_hand2, trans);
				}
				else {
					if ((((_reloadTime < 1)) || ((_gunData.gun_hasReloadAnim == 0)))){
						interpFun(_gunX, _gunY, _gunXOld, _gunYOld);
						trans.createBox(1, 1, rotInterp, (interpFinal.x - cameraX), ((interpFinal.y - cameraY) + _gunData.gunShoulder_y));
						if (_spriteSet == 0){
							bm.draw(this[((("gun_" + _gunEquipped) + "_right_") + this[("_gunFrames_" + _gunEquipped)][_gunFrame])], trans);
						}
						else {
							bm.draw(this[((("enemy_gun_" + (_spriteSet - 1)) + "_right_") + this[("_gunFrames_" + _gunEquipped)][_gunFrame])], trans);
						};
					}
					else {
						interpFun(_posX, _posY, _posX_old, _posY_old);
						rect.width = _gunData.gun_reload_w;
						rect.height = this[(("gun_" + _gunEquipped) + "_reload_right.height;
						tempPoint.x = (interpFinal.x + _gunData.gun_reload_x);
						tempPoint.y = (interpFinal.y + _gunData.gun_reload_y);
						rect.x = (30 - int((30 * (_reloadTime / (_gunData.gun_reload_time + 1)))));
						if (rect.x < 0){
							rect.x = 0;
						}
						else {
							if (rect.x > 29){
								rect.x = 29;
							};
						};
						if ((((rect.x >= _gunData.gun_magDropFrame)) && ((hasDroppedMag == false)))){
							switch (_gunData.gun_magType){
								case 1:
									sound.playSoundEffect(49, 1, 0);
									Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, (Math.random() * 7), (Math.random() * 2), 4, 4, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
									break;
								case 3:
									sound.playSoundEffect(49, 1, 0);
									Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, (Math.random() * 7), (Math.random() * 2), 4, 5, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
									break;
								case 4:
									b = 0;
									while (b < 6) {
										Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, (Math.random() * -7), (Math.random() * 2), 0, 3, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
										b++;
									};
									break;
								case 5:
									b = 0;
									while (b < 5) {
										Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, (Math.random() * -7), (Math.random() * 2), 0, 3, (int((Math.random() * 3)) + 10), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
										b++;
									};
									break;
								case 6:
									sound.playSoundEffect(49, 1, 0);
									Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, (Math.random() * 7), (Math.random() * 2), 4, 6, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
									break;
								case 7:
									sound.playSoundEffect(49, 1, 0);
									Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, (Math.random() * 7), (Math.random() * 2), 4, 7, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
									break;
								case 8:
									Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, ((Math.random() * 8) + 12), ((Math.random() * -8) - 6), 4, 8, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
									break;
								case 9:
									b = 0;
									while (b < 4) {
										Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, (Math.random() * -7), (Math.random() * 2), 0, 3, (int((Math.random() * 3)) + 10), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
										b++;
									};
							};
							hasDroppedMag = true;
						};
						rect.x = (rect.x * _gunData.gun_reload_w);
						rect.y = 0;
						bm.copyPixels(this[(("gun_" + _gunEquipped) + "_reload_right, rect, tempPoint, null, null, false);
					};
				};
			}
			else {
				if (_charAnimData.hasHands == 1){
					interpFun(_posX, _posY, _posX_old, _posY_old);
					trans.createBox(-1, 1, _charAnimData.hand1_r[int(interpFrame)], (interpFinal.x - _charAnimData.hand1_x[int(interpFrame)]), (interpFinal.y + _charAnimData.hand1_y[int(interpFrame)]));
					bm.draw(_charAsset.char_hand1, trans);
				}
				else {
					if ((((_reloadTime < 1)) || ((_gunData.gun_hasReloadAnim == 0)))){
						interpFun(_gunX, _gunY, _gunXOld, _gunYOld);
						trans.createBox(1, -1, -(rotInterp), (interpFinal.x - cameraX), ((interpFinal.y - cameraY) + _gunData.gunShoulder_y));
						if (_spriteSet == 0){
							bm.draw(this[((("gun_" + _gunEquipped) + "_left_") + this[("_gunFrames_" + _gunEquipped)][_gunFrame])], trans);
						}
						else {
							bm.draw(this[((("enemy_gun_" + (_spriteSet - 1)) + "_left_") + this[("_gunFrames_" + _gunEquipped)][_gunFrame])], trans);
						};
					}
					else {
						interpFun(_posX, _posY, _posX_old, _posY_old);
						rect.width = _gunData.gun_reload_w;
						rect.height = this[(("gun_" + _gunEquipped) + "_reload_left.height;
						tempPoint.x = ((interpFinal.x - _gunData.gun_reload_x) - _gunData.gun_reload_w);
						tempPoint.y = (interpFinal.y + _gunData.gun_reload_y);
						rect.x = (30 - int((30 * (_reloadTime / (_gunData.gun_reload_time + 1)))));
						if (rect.x < 0){
							rect.x = 0;
						}
						else {
							if (rect.x > 29){
								rect.x = 29;
							};
						};
						if ((((rect.x >= _gunData.gun_magDropFrame)) && ((hasDroppedMag == false)))){
							switch (_gunData.gun_magType){
								case 1:
									Particle.addParticle(0, ((tempPoint.x + (_gunData.gun_reload_w - _gunData.gun_reload_mag_x)) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, ((tempPoint.x + (_gunData.gun_reload_w - _gunData.gun_reload_mag_x)) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, (Math.random() * -7), (Math.random() * 2), 4, 4, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
									break;
								case 3:
									Particle.addParticle(0, ((tempPoint.x + (_gunData.gun_reload_w - _gunData.gun_reload_mag_x)) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, ((tempPoint.x + (_gunData.gun_reload_w - _gunData.gun_reload_mag_x)) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, (Math.random() * -7), (Math.random() * 2), 4, 5, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
									break;
								case 4:
									b = 0;
									while (b < 6) {
										Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, (Math.random() * 7), (Math.random() * 2), 0, 3, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
										b++;
									};
									break;
								case 5:
									b = 0;
									while (b < 5) {
										Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, (Math.random() * 7), (Math.random() * 2), 0, 3, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
										b++;
									};
									break;
								case 6:
									Particle.addParticle(0, ((tempPoint.x + (_gunData.gun_reload_w - _gunData.gun_reload_mag_x)) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, ((tempPoint.x + (_gunData.gun_reload_w - _gunData.gun_reload_mag_x)) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, (Math.random() * -7), (Math.random() * 2), 4, 6, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
									break;
								case 7:
									Particle.addParticle(0, ((tempPoint.x + (_gunData.gun_reload_w - _gunData.gun_reload_mag_x)) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, ((tempPoint.x + (_gunData.gun_reload_w - _gunData.gun_reload_mag_x)) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, (Math.random() * -7), (Math.random() * 2), 4, 7, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
									break;
								case 8:
									Particle.addParticle(0, ((tempPoint.x + (_gunData.gun_reload_w - _gunData.gun_reload_mag_x)) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, ((tempPoint.x + (_gunData.gun_reload_w - _gunData.gun_reload_mag_x)) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, ((Math.random() * -8) - 12), ((Math.random() * -8) - 6), 4, 8, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
									break;
								case 9:
									b = 0;
									while (b < 4) {
										Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, (Math.random() * 7), (Math.random() * 2), 0, 3, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
										b++;
									};
									break;
							};
							hasDroppedMag = true;
						};
						rect.x = (rect.x * _gunData.gun_reload_w);
						rect.y = 0;
						bm.copyPixels(this[(("gun_" + _gunEquipped) + "_reload_left, rect, tempPoint, null, null, false);
					};
				};
				interpFun(_posX, _posY, _posX_old, _posY_old);
				trans.createBox(-1, 1, _charAnimData.foot2_r[int(interpFrame)], (interpFinal.x - _charAnimData.foot2_x[int(interpFrame)]), (interpFinal.y + _charAnimData.foot2_y[int(interpFrame)]));
				bm.draw(_charAsset.char_foot, trans);
				trans.createBox(-1, 1, _charAnimData.ankle2_r[int(interpFrame)], (interpFinal.x - _charAnimData.ankle2_x[int(interpFrame)]), (interpFinal.y + _charAnimData.ankle2_y[int(interpFrame)]));
				bm.draw(_charAsset.char_ankle, trans);
				trans.createBox(-1, 1, _charAnimData.body_r[int(interpFrame)], (interpFinal.x - _charAnimData.body_x[int(interpFrame)]), (interpFinal.y + _charAnimData.body_y[int(interpFrame)]));
				bm.draw(_charAsset.char_body, trans);
				if (_charAnimData.headRot == 0){
					tempHeadRot = _headRot;
					if (tempHeadRot < 0){
						if (tempHeadRot > -2.5){
							tempHeadRot = -2.5;
						};
					}
					else {
						if (tempHeadRot < 2.75){
							tempHeadRot = 2.75;
						};
					};
					trans.createBox(1, -1, -(tempHeadRot), (interpFinal.x - _charAnimData.head_x[int(interpFrame)]), (interpFinal.y + _charAnimData.head_y[int(interpFrame)]));
				}
				else {
					trans.createBox(-1, 1, _charAnimData.head_r[int(interpFrame)], (interpFinal.x - _charAnimData.head_x[int(interpFrame)]), (interpFinal.y + _charAnimData.head_y[int(interpFrame)]));
				};
				if (_headless == false){
					bm.draw(_charAsset.char_head, trans);
				};
				trans.createBox(-1, 1, _charAnimData.foot1_r[int(interpFrame)], (interpFinal.x - _charAnimData.foot1_x[int(interpFrame)]), (interpFinal.y + _charAnimData.foot1_y[int(interpFrame)]));
				bm.draw(_charAsset.char_foot, trans);
				trans.createBox(-1, 1, _charAnimData.ankle1_r[int(interpFrame)], (interpFinal.x - _charAnimData.ankle1_x[int(interpFrame)]), (interpFinal.y + _charAnimData.ankle1_y[int(interpFrame)]));
				bm.draw(_charAsset.char_ankle, trans);
				if (_charAnimData.hasHands == 1){
					trans.createBox(-1, 1, _charAnimData.hand2_r[int(interpFrame)], (interpFinal.x - _charAnimData.hand2_x[int(interpFrame)]), (interpFinal.y + _charAnimData.hand2_y[int(interpFrame)]));
					bm.draw(_charAsset.char_hand2, trans);
				};
			};
		}