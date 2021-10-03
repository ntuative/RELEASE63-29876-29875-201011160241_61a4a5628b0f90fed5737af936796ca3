package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_161;
         param1["bound_to_parent_rect"] = const_89;
         param1["child_window"] = const_1087;
         param1["embedded_controller"] = const_900;
         param1["resize_to_accommodate_children"] = const_66;
         param1["input_event_processor"] = const_43;
         param1["internal_event_handling"] = const_582;
         param1["mouse_dragging_target"] = const_218;
         param1["mouse_dragging_trigger"] = const_344;
         param1["mouse_scaling_target"] = const_295;
         param1["mouse_scaling_trigger"] = const_394;
         param1["horizontal_mouse_scaling_trigger"] = const_224;
         param1["vertical_mouse_scaling_trigger"] = const_203;
         param1["observe_parent_input_events"] = const_1035;
         param1["optimize_region_to_layout_size"] = const_412;
         param1["parent_window"] = const_1036;
         param1["relative_horizontal_scale_center"] = const_158;
         param1["relative_horizontal_scale_fixed"] = const_123;
         param1["relative_horizontal_scale_move"] = const_376;
         param1["relative_horizontal_scale_strech"] = WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_STRECH;
         param1["relative_scale_center"] = const_989;
         param1["relative_scale_fixed"] = const_702;
         param1["relative_scale_move"] = const_1048;
         param1["relative_scale_strech"] = const_987;
         param1["relative_vertical_scale_center"] = const_173;
         param1["relative_vertical_scale_fixed"] = const_120;
         param1["relative_vertical_scale_move"] = const_373;
         param1["relative_vertical_scale_strech"] = const_322;
         param1["on_resize_align_left"] = const_565;
         param1["on_resize_align_right"] = const_425;
         param1["on_resize_align_center"] = const_508;
         param1["on_resize_align_top"] = const_649;
         param1["on_resize_align_bottom"] = const_446;
         param1["on_resize_align_middle"] = const_417;
         param1["on_accommodate_align_left"] = const_970;
         param1["on_accommodate_align_right"] = const_450;
         param1["on_accommodate_align_center"] = const_569;
         param1["on_accommodate_align_top"] = const_1013;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_614;
         param1["route_input_events_to_parent"] = const_389;
         param1["use_parent_graphic_context"] = const_31;
         param1["draggable_with_mouse"] = const_991;
         param1["scalable_with_mouse"] = const_873;
         param1["reflect_horizontal_resize_to_parent"] = WINDOW_PARAM_REFLECT_HORIZONTAL_RESIZE_TO_PARENT;
         param1["reflect_vertical_resize_to_parent"] = const_406;
         param1["reflect_resize_to_parent"] = const_275;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
