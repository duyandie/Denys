<?php
class CategoryModel extends BaseModel
{
  protected $table = 'categories_table'; // Đặt tên bảng
  protected $column = [
    'id' => 'id',
    'name' => 'name',
    'description' => 'description',
    'status' => 'status',
    'created_At' => 'createdAt',
    'updated_At' => 'updatedAt'
  ];
}
