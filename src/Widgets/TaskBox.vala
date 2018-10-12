namespace Timetable {
    public class TaskBox : Gtk.ListBoxRow {
        public MainWindow win;
        public string task_name;
        public EdtableLabel task_label;
        public TaskBox (MainWindow win, string task_name) {
            this.win = win;
            this.task_name = task_name;
            var task_box_style_context = this.get_style_context ();
            task_box_style_context.add_class ("tt-box");

            task_label = new EditableLabel (task_name);
            var task_delete_button = new Gtk.Button ();
            var task_delete_button_style_context = task_delete_button.get_style_context ();
            task_delete_button_style_context.add_class (Gtk.STYLE_CLASS_FLAT);
            task_delete_button.set_image (new Gtk.Image.from_icon_name ("edit-delete-symbolic", Gtk.IconSize.SMALL_TOOLBAR));

            var task_grid = new Gtk.Grid ();
            task_grid.hexpand = false;
            task_grid.margin_top = task_grid.margin_bottom = 12;
            task_grid.margin_start = task_grid.margin_end = 6;
            task_grid.attach (task_label, 0, 0, 1, 1);
            task_grid.attach (task_delete_button, 1, 0, 1, 1);

            task_delete_button.clicked.connect (() => {
                delete_task ();
                win.tm.save_notes ();
            });

            this.add (task_grid);
            this.hexpand = false;
            this.show_all ();
        }

        public void delete_task () {
            this.destroy ();
        }
    }
}
