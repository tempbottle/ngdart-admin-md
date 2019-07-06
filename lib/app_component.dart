import 'dart:async';
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_components/app_layout/material_persistent_drawer.dart';
import 'package:angular_components/content/deferred_content.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_list/material_list.dart';
import 'package:angular_components/material_list/material_list_item.dart';
import 'package:angular_components/material_toggle/material_toggle.dart';

@Component(
  selector: 'my-app',
  styleUrls: [
    'package:angular_components/app_layout/layout.scss.css',
    'app_component.css'
  ],
  templateUrl: 'app_component.html',
  directives: [
    DeferredContentDirective,
    MaterialButtonComponent,
    MaterialIconComponent,
    MaterialPersistentDrawerDirective,
    MaterialToggleComponent,
    MaterialListComponent,
    MaterialListItemComponent,
  ],
)
class AppComponent implements AfterViewInit {
  bool customWidth = false;
  bool end = false;

  void ngAfterViewInit() {
    scheduleMicrotask(this._setSize);
    window.onResize.listen((event) => this._setSize());
  }

  void _setSize() {
    List<Element> els = window.document.querySelectorAll("my-app");
    var h = window.innerHeight;
    for (var e in els) {
      e.style.height = h.toString() + "px";
    }
  }
}
