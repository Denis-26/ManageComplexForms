//
// Created by Denis Kartavenko on 29.01.2020.
// Copyright (c) 2020 Denis. All rights reserved.
//

import SnapKit

class LayoutUtil {

	struct Padding {
		var top: CGFloat
		var left: CGFloat
		var bottom: CGFloat
		var right: CGFloat

		init(_ commonPadding: CGFloat) {
			top = commonPadding
			left = commonPadding
			bottom = commonPadding
			right = commonPadding
		}

		init(top: CGFloat = 10, left: CGFloat = 10, bottom: CGFloat = 10, right: CGFloat = 10) {
			self.top = top
			self.left = left
			self.bottom = bottom
			self.right = right
		}
	}

	static func stretchToSubview(_ view: UIView, padding: Padding = Padding()) {
        view.snp.makeConstraints { make in
			make.edges.equalToSuperview()
					.inset(UIEdgeInsets.init(
							top: padding.top, left: padding.left, bottom: padding.bottom, right: padding.right))
					.priority(999)
        }
	}
}
