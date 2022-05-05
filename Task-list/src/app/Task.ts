export interface Task {
    id?: number; // Cuando creamos podría no venir.
    text: string;
    day: string;
    reminder: boolean;
}
