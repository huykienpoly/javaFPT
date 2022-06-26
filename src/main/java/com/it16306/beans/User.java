package com.it16306.beans;

import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Email;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Component
public class User {
	@NotBlank(message = "Không được để trống")
	private String hoTen;
	@NotBlank(message = "Không được để trống")
	private String diaChi;

	@NotNull
	private int gioiTinh;

	@NotBlank(message = "Không được để trống")
	@Email
	@Pattern(regexp = "\\w+@fpt.edu.vn", message = "phải đúng định dạng fpt")
	private String email;

	@NotBlank(message = "Không được để trống")
	@Length(min=6)
	private String password;

	@NotBlank(message = "Không được để trống " )
	 @Size(min=10, max=11 ,message = "sdt để từ 10-11")
	@Pattern(regexp = "0\\d{2}\\d{2}\\d{5}", message = "SDT sai định dạng")

	private String sdt;

	@NotBlank(message = "Không được để trống")
	private String avatar;

}
